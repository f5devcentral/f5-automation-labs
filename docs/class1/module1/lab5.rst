.. |labmodule| replace:: 1
.. |labnum| replace:: 5
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – BIG-IPクラスタを構築
----------------------------------------------------

このラボでは、BIG-IP-AとBIG-IP-Bの間にアクティブスタンバイクラスタを構築します。 時間を節約するため、BIG-IP-Bは既にライセンスが与えられており、デバイスレベルの設定が構成されています。
このラボでは、手順に従ってクラスタを作成します。このような複雑な操作は、** Imperative **モデルの自動化を使用すると有効性が低下することがわかります。
クラスタリングは、ほとんどの顧客が**Declarative**モデルに移行するためのきっかけの1つです。 これは、自動化を利用するユーザーからデバイス/ベンダーレベルの詳細を隠し、抽象化する必要があるためです。

クラスタを作成するために大まかな手順は次のとおりです:

#.  CMIの‘Self’デバイス名をデバイスのホスト名と一致するように変更

#.  BIGIP-AおよびBIGIP-BのCMIパラメータを設定（Config Sync IP、フェールオーバーIP、ミラーリングIP）

#.  BIGIP-Aで信頼できるピアとしてBIG-IP-Bを追加

#.  device\_trust\_groupのSync Group Statusを確認

#.  sync-failover用のDevice Groupを作成

#.  作成したDevice Groupの冗長化の状態を確認

#.  Device Groupの初期同期を実行

#.  再度、Device Groupの冗長化の状態を確認

#.  HA Orderフェールオーバーを使用するようにトラフィックグループを変更
　　　　（必須ではありませんが、例として示されています）

#. 　Floating Self IPを作成


Task 1 – オブジェクト名の変更とCMIグローバルパラメータの設定
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

このタスクでは、上記のリストから項目1と2を実施します。 
BIG-IPの特質の1つは、GUIセットアップウィザードを使用してデバイスのホスト名を設定すると、ウィザードは自動的にCMIの‘Self’デバイスの名前を変更してホスト名と一致させます。 以前の手順ではREST呼び出しでホスト名を設定していたので、このアクションは実行されませんでした。

CMIの‘Self’デバイスの名前を変更するための手順は以下のとおりです:

#. Postman Collection内の“Lab 1.5 – Build a Cluster”フォルダを展開します。

#. Collection内の“Step 1: Rename the CMI Self Device’項目をクリックします。

#. URIとJSONボディを確認します。
※既存のオブジェクトの名前を ``/mgmt/tm/cm/device``Collectionに変更するために、tmsh ``mv``コマンドに相当するものを実行するPOSTリクエストを送信します。``name``属性はオブジェクトの現在の名前（工場出荷時のデフォルト名）を指定し、 ``target``属性はオブジェクトの新しい名前を指定します。

#. ‘Send’ボタンをクリックし、Resource名を変更します。

#. リクエストタイプをPOSTからGETに変更し、‘Send’をクリックします。レスポンス内の名前が正常に変更されたことを確認します。

CMIデバイスパラメータを設定するための手順は以下のとおりです:

#. Collection内の“Step 2: Set BIGIP-A CMI Device Parameters”項目をクリックして、操作(PATCH)、URI、およびJSONボディを確認します。

   ※前の手順で新しく名前を変更したオブジェクトをパッチし、Config Sync IP、ユニキャストフェールオーバーアドレス/ポート、およびミラーリングIPを割り当てます。

   |image28|

#. ‘Send’ボタンをクリックし、 応答で設定が変更されたことを確認します。

#. Collection内の“Step 3: Set BIGIP-B CMI Device Parameters”項目をクリック、操作(PATCH)、URI、およびJSONボディを確認します。

　　　※Config Sync IP、ユニキャストフェイルオーバーアドレス/ポート、およびミラーリングIPを割り当てるためのPATCH要求を送信します。

   *EXTRA CREDIT:認証トークンがない場合、BIG-IP-Bへの認証はどのように機能しますか？ (Hint: we cheated)*

#. ‘Send’ボタンをクリックして、レスポンス内の名前が正常に変更されたことを確認します。

Task 2 – 信頼できるピアとしてBIG-IP-Bを追加
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CMIサブシステムは、BIG-IPシステム間の関係を確立するためのPKIベースのデバイス信頼モデルに依存しています。
このタスクでは、BIG-IP-BをBIG-IP-Aの信頼できるピアとして追加します。 信頼関係を確立することは、自動的に双方向の操作です。
その結果、信頼関係を確立すると、BIG-IP-Bは自動的にBIG-IP-Aとの信頼関係を確立します。 このタスクは、上記のリストの項目3と4に該当します。

このタスクを完了するには、次の手順を実行します:

#. Collection内の“Step 4: Add BIGIP-B Device to CMI Trust on BIGIP-A”の項目をクリックします。

#. 操作(PATCH)、URI、およびJSONボディを確認します。

※特別なRESTワーカーを使用し、デバイスをCMI trustに追加しています。さらに、このステップが正常に完了するように、JSONボディを非常に特殊な方法で指定する必要があります。エラーの可能性を最小限に抑えるため、値はすでに指定されています。 ただし、この手順を十分に確認して理解してから、続行することを推奨します。

#. ‘Send’ボタンをクリックします。
※この要求に対する応答は成功を示すものではなく、コマンドが実行中であることのみを示します。

#. 成功しているか否かを確認するには、 “device\_trust\_group”という名前の同期グループのステータスをチェックする必要があります。これを行うには、コレクションの“Step 5: Check　Sync Group Status”をクリックします。この要求は、システム上のすべてのsync groupの同期ステータスを取得します。

#. ‘Send’ボタンをクリックし、応答を確認します。
※同期ステータスが‘green’になると、bigip-b.f5.localが接続され、‘In Sync’であることを意味します(何らかの問題があった場合はインストラクターにお知らせください):

   |image29|

Task 3 – Sync-Failover Device Groupを作成
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

このタスクでは、2つのBIG-IPシステムを含むDevice Groupオブジェクトを作成します。
Device Groupのタイプは‘sync-failover’グループになりますが、
異なる属性値を使用して同じ手順で‘sync-only’グループを作成することもできます。
このタスクは、上記のリストの項目5-8に該当します。

このタスクを完了するには、次の手順を実行します:

#. Collection内の“Step 6: Create Device Group” の項目をクリックし、リクエストタイプ、URL、とJSONボディを確認します。
※ ‘/mgmt/tm/cm/device-group’collectionにPOSTし、両方のBIG-IPデバイスを含むDeviceGroup1という新しいリソース（‘sync-failover’用）を作成します。また、デバイスグループを‘autosync’に設定すると、構成が変更されたときに手動で同期する必要はありません。

   |image30|

#. ‘Send’ボタンをクリックし、応答を確認します。

#. Device Groupのステータスをチェックするには、Sync Groupのステータスをチェックする必要があります。Collection内の‘Step 7: Check Sync Group Status’の項目をクリックし、‘Send’ボタンをクリックします。応答を確認し、デバイスの状態が‘Awaiting　Initial Sync’になっていることを確認します。

   |image31|

#. DeviceGroup1を手動で同期し、必要な初期同期(Initial Sync)を開始します。Collection内の‘Step 8: Manually Sync DeviceGroup1’の項目をクリックし、リクエストタイプ、URL、とJSONボディを確認します。‘/mgmt/tm/cm/config-sync’ワーカーにPOSTリクエストを送信し、BIG-IP-AからのDeviceGroup1へのconfig-sync(‘to-group’)を実行するように指示します。

   |image32|

#. ‘Send’ボタンをクリックし、同期を開始します。

#. Collection内の‘Step 9: Check Sync Group Status’の項目をクリックし、‘Send’ボタンをクリックします。応答を確認し、DeviceGroup1の状態が‘In Sync’になっていることを確認します。
   
   ※同期操作が完了するまでに時間がかかることがあるため、‘Send’を何度かクリックすることがあります。


Task 4 – 追加の操作を実行
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

残りの手順では、HA設定に関連するさまざまな共通項目を操作する方法を示します。
このタスクでは、トラフィックグループを変更し、‘HA Order’フェールオーバー方式を使用します。 その後、フェールオーバーを開始し、トラフィックグループのステータスを確認する方法を示します。

このタスクを完了するには、次の手順を実行します:

#. Collection内の“Step 10: Get Traffic Group Properties”の項目をクリックして、URLを確認します。traffic-groupのCollectionから ‘traffic-group-1’リソースの属性をGETします。‘Send’ボタンをクリックし、応答を確認します。

#. Collection内の“Step 11: Change Traffic Group to use HA Order”の項目をクリックし、リクエストタイプ、URL、とJSONボディを確認します。既存のリソースにPATCHを送信し、トラフィックグループの動作を変更するための‘haOrder’属性を指定します。

#. ‘Send’ボタンをクリックし、変更が成功したか否かを確認します。

#. Collection内の“Step 12: Get Traffic Group Failover States”の項目をクリックし、‘Send’ボタンをクリックします。応答を確認し、どのデバイスが‘active’となっているかを確認します。

   |image33|

#. トラフィックグループに対してどのデバイスがACTIVEであるかに応じて、Collection内の“Step 13A”または“Step 13B”のいずれかのアイテムをクリックします。
※トラフィックグループに対してACTIVEデバイスにリクエストを送信していることに注目してください。JSONボディを確認し、‘Send’ボタンをクリックします。

#. Collection内の“Step 14: Get Traffic Group Failover States”の項目をクリックし、‘Send’ボタンをクリックします。応答を確認し、フェールオーバーが正常に行われたことを確認します。

   |image34|

Task 5 – Floating Self IPの作成
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

HA設定を完了するために、Internal VLANでFloating Self IPを作成します。

このタスクを完了するには、次の手順を実行します:

#. Collection内の“Step 15: Create a Floating Self IP”の項目をクリックし、リクエストタイプ、URL、とJSONボディを確認します。``/mgmt/tm/net/self``のCollectionに‘Self-Internal-Floating’というリソースをIPアドレス10.1.10.3で作成します。

#. ‘Send’ボタンをクリックし、応答を確認します。

#. Collection内の“Step 16: Get Self IPs”の項目をクリックして、‘Send’ボタンをクリックします。応答を確認し、Self IPが作成されたことを確認します。

.. |image28| image:: /_static/image028.png
   :scale: 40%
.. |image29| image:: /_static/image029.png
   :width: 6.08403in
   :height: 4.50000in
.. |image30| image:: /_static/image030.png
   :scale: 40%
.. |image31| image:: /_static/image031.png
   :width: 6.16783in
   :height: 3.93018in
.. |image32| image:: /_static/image032.png
   :scale: 40%
.. |image33| image:: /_static/image033.png
   :width: 6.03658in
   :height: 3.82946in
.. |image34| image:: /_static/image034.png
   :width: 6.10321in
   :height: 4.10659in
