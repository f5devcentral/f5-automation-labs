.. |labmodule| replace:: 1
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – REST API認証と 'example'テンプレート
---------------------------------------------------------------------------

REST APIインターフェイスとやり取りするときに理解する必要がある基本的な概念の1つは、ユーザーとシステム間の認証方法です。
BIG-IPとiWorkflowは、2種類の認証をサポートしています: HTTP BASICとToken　based。 ユースケースによっては、APIのユーザーが両方のタイプを使用することが多いため、これらの認証メカニズムの両方を理解することが重要です。
このラボでは、両方の認証方法について説明します。

Task 1 - Postmanのコレクションと環境変数をインポートする
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

このラボで使用されるPostmanのコレクションと環境変数をインポートします。

このタスクを完了するには、次の手順を実行します:

#. Windows Jumphostのタスクバーの |image8| アイコンをクリックして、Postmanツールを開きます。


#. Postman画面の左上にある'Import'ボタンをクリックします。

   |image87|

#. 'Import from Link'タブをクリックします。 テキストボックスに次のURLを貼り付けて、'Import'をクリックします。

   .. parsed-literal:: 

      :raw_github_url:`/postman_collections/F5_Automation_Orchestration_Intro.postman_collection.json`

   |image88|

#. Postman Collectionsのサイドバーに'F5 Automation & Orchestration Intro'という名前のコレクションが表示されます。

   |image10|

#. 'Import' -> 'Import from Link'をクリック、次のURLを貼り付けて'Import'をクリックして、環境ファイルをインポートします。

   .. parsed-literal:: 

      :raw_github_url:`/postman_collections/INTRO_Automation_Orchestration_Lab.postman_environment.json`

#.　Postmanの‘Environments’(環境変数)機能を使用して、複数のステップを含むプロシージャでよく使用されるグローバル変数を定義します。これらのグローバル変数は、リクエストが送信される前に置換されます。Postman画面の右上にあるプルダウンより環境を 'INTRO - Automation＆Orchestration Lab'に設定します。

   |image9|

Task 2 – HTTP BASIC認証
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

このタスクでは、Postmanツールを使用してHTTP BASIC認証を使ったAPIリクエストを送信します。
この認証方法は、HTTPプロトコルで提供されている既存のBASIC認証方法を使用してユーザー名とパスワードをエンコードします。
このメカニズムは、``<username>:<password>``という文字列をBase 64でエンコードした値で ‘Authorization’という名前のHTTPヘッダを挿入します。その結果のヘッダーは次の形式になります。

``Authorization: Basic YWRtaW46YWRtaW4=``

この認証方法は簡単にクラックする可能性があるため、HTTPではなくHTTPS（F5デフォルト）を使用してAPI呼び出しを実行することを推奨します。

このタスクを完了するには、次の手順を実行します:


#. 画面の左側にある‘Collections’タブをクリックし、画面の左側にある‘F5 Automation & Orchestration Intro’コレクションを展開し、‘Lab 1.2 – API Authentication’フォルダを展開します。

   |image10|

#. ‘Step 1: HTTP BASIC Authentication’をクリックします。そして、‘Authorization’タブをクリックし、Typeとして‘Basic Auth’を選択します。資格情報(admin/admin)を入力して、‘Update Request’ボタンをクリックします。‘Headers’タブのヘッダーの数が1から2に変更されていることに注目してください。これは、Postmanが自動的にHTTPヘッダーを作成し、それを含むリクエストを更新したためです。‘Headers’タブをクリックし、HTTPヘッダーを確認します。

   |image11|

#. リクエストを送信するには‘Send’ボタンをクリックします。リクエストが成功した場合は、 ``/mgmt/tm/ltm``のOrganizing Collectionのリストが表示されます。


#. パスワードを更新し、不正なパスワードを指定してください。. リクエストを再度送信し、レスポンスを確認します。

   |image12|

Task 3 – トークンベースの認証
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BASIC認証の欠点の1つは、各要求ごとにユーザ名とパスワードが送信されることです。これにより攻撃面が大きくなり、サイバーリスクが増加する可能性があります。その結果、多くの場合、トークンベースの認証（TBA）が優先されます。このメソッドは、最初の要求で一度だけユーザ名とパスワードを送信します。 その後、デバイスは、ユーザーが同じセッション内のすべての後続の要求に使用するユニークなトークンで応答します。

BIG-IPとiWorkflowは、TMOSで利用可能な基盤となる認証サブシステムに到達するトークンベース認証をサポートしています。 その結果、外部認証プロバイダ（RADIUS、TACACS、ADなど）をサポートするようにシステムを構成することができ、これらの認証メソッドをREST APIに流すことができます。

このタスクでは、ローカル認証データベースを使用してTBAを検証しますが、外部プロバイダへの認証も完全にサポートされています。

外部認証プロバイダの詳細については、 https://devcentral.f5.com の「iControl REST API User Guide」の“\ **About external authentication providers with iControl REST**\ ”をご参照ください。


このタスクを完了するには、次の手順を実行します:

#. Lab 1.2　Postman Collectionの‘Step 2: Get Authentication Token’の項目をクリックします。


#. ``/mgmt/shared/authn/login``エンドポイントにPOSTリクエストを送信したことに注目してください。

   |image13|

#. ‘Body’タブをクリックし、資格情報と認証プロバイダを提供するためにBIG-IPに送信するJSONを確認します。

   |image14|

#. JSONボディを変更し、資格情報(admin/admin)を追加します。 次に、‘Send’ボタンをクリックします。


#. レスポンスステータスコードを確認します。 認証が成功し、トークンが生成された場合、応答は200 OKステータスコードを返します。
   ステータスコードが401の場合は、資格情報を確認してください。

   **Successful:**

   - |image15|

   **Unsuccessful:**

   - |image16|

#. 200 OKのステータスコードを受け取ったら、レスポンスボディをチェックして、特定のトークンに割り当てられたパラメータを示すさまざまな属性を確認します。‘token’属性を見つけてクリップボードにコピーして(Ctrl+c)、次のステップで使用します。

   |image17|

#. Lab 1.2 Postman Collectionの‘Step 3: Verify Authentication Works’の項目をクリックします。‘Headers’タブをクリックし、``X-F5-Auth-Token``ヘッダーのVALUEとしてトークン値を貼り付けます。トークンベースの認証を使用する場合、このヘッダーはすべての要求で送信する必要があります。

   |image18|

#. ‘Send’ボタンをクリックします。 リクエストが成功すると、 ‘200 OK’ステータスと ``ltm`` Organizing Collectionのリストが表示されます。


#. ここでは、残りのラボでこの認証トークンを使用するようにPostmanの環境変数を更新します。Postman画面の右上にある‘Environment‘メニューをクリックし、‘Manage Environments’をクリックします。

   |image19|

#. ‘INTRO – Automation & Orchestration Lab’の項目をクリックしてください。

   |image20|

#. Value欄に認証トークンを貼り付けて（Ctrl-v）、``bigip_a_auth_token``の値を更新します。

   |image21|

#. ‘Update’ボタンをクリックし、‘Manage Environments’ウィンドウを閉じます。後続のリクエストに自動的にトークンが追加されるようになりました。


#. Lab 1.2 Postman Collectionの‘Step 4: Set Authentication Token Timeout’をクリックします。このリクエストにより、PATCH要求が送信され、トークンリソースのタイムアウト属性が更新され（URIをチェック）、ラボを簡単に完了することができます。リクエストのタイプとJSONボディを確認し、‘Send’ボタンをクリックします。 応答でタイムアウトが ‘36000’に変更されていることを確認します。

   |image22|

Task 4 – プール情報を取得する ‘example’ テンプレート
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

REST APIのやりとりを支援するために、コレクション内のリソースタイプのさまざまな属性のテンプレートをリクエストできます。 このテンプレートは、必要に応じてPOST、PUT、またはPATCH要求のボディとして使用できます。

このタスクを完了するには、次の手順を実行します:

#. Lab 1.2 Postman collectionの‘Step 5: Get ‘example’ of a Pool Resource’の項目をクリックします。

#. URIを確認します。 コレクション名の末尾に‘example’が追加されていることに注目してください。

   |image23|

#. ‘Send’をクリックし、FULLレスポンスを確認します。 プールリソースタイプのdescriptionとすべての属性が表示されます。 該当する場合は、属性のデフォルト値も表示されます

   |image24|


.. |image8| image:: /_static/image008.png
   :width: 0.46171in
   :height: 0.43269in
.. |image9| image:: /_static/image009.png
   :scale: 40%
.. |image10| image:: /_static/image010.png
   :width: 3.54657in
   :height: 2.80000in
.. |image11| image:: /_static/image011.png
   :scale: 40%
.. |image12| image:: /_static/image012.png
   :width: 6.41783in
   :height: 0.81396in
.. |image13| image:: /_static/image013.png
   :scale: 40%
.. |image14| image:: /_static/image014.png
   :scale: 40%
.. |image15| image:: /_static/image015.png
   :width: 6.25116in
   :height: 0.79689in
.. |image16| image:: /_static/image016.png
   :width: 6.25116in
   :height: 0.79248in
.. |image17| image:: /_static/image017.png
   :width: 6.43324in
   :height: 3.00000in
.. |image18| image:: /_static/image018.png
   :scale: 40%
.. |image19| image:: /_static/image019.png
   :width: 2.42051in
   :height: 1.70218in
.. |image20| image:: /_static/image020.png
   :width: 4.67051in
   :height: 1.23217in
.. |image21| image:: /_static/image021.png
   :scale: 40%
.. |image22| image:: /_static/image022.png
   :scale: 40%
.. |image23| image:: /_static/image023.png
   :scale: 40%
.. |image24| image:: /_static/image024.png
   :width: 5.75466in
   :height: 4.66667in
.. |image87| image:: /_static/image087.png
   :scale: 40%
.. |image88| image:: /_static/image088.png
   :scale: 40%