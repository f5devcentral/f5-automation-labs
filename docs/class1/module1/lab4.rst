.. |labmodule| replace:: 1
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – 基本ネットワーク接続
--------------------------------------------------------

このラボでは、次の項目の設定に焦点を当てます:

-  L1-3ネットワーク

   -  物理インターフェイスの設定

   -  L2接続 (**VLAN**, VXLAN, etc.)

   -  L3接続 (**Self IPs, Routing**, etc.)

以下のラボでは、**BOLD**となっている項目を設定します。 
デバイスオンボーディングプロセスの多くの順列は、顧客環境の異なる要求のために存在します。
このセクションでは、学習した知識を適用し、環境に特化したソリューションを提供するために十分な情報を教えるように設計されています。


次の表に、BIG-IP-Aの接続を設定するために使用されるL2-3ネットワーク情報を示します:

+-----------+-----------------+-------------------------+
| Type      | Name            | Details                 |
+===========+=================+=========================+
| VLAN      | Internal        | Interface: 1.1          |
|           |                 |                         |
|           |                 | Tag: 10                 |
+-----------+-----------------+-------------------------+
| VLAN      | External        | Interface: 1.2          |
|           |                 |                         |
|           |                 | Tag: 20                 |
+-----------+-----------------+-------------------------+
| Self IP   | Self-Internal   | Address: 10.1.10.1/24   |
|           |                 |                         |
|           |                 | VLAN: Internal          |
+-----------+-----------------+-------------------------+
| Self IP   | Self-External   | Address: 10.1.20.1/24   |
|           |                 |                         |
|           |                 | VLAN: External          |
+-----------+-----------------+-------------------------+
| Route     | Default         | Network: 0.0.0.0/0      |
|           |                 |                         |
|           |                 | GW: 10.1.20.254         |
+-----------+-----------------+-------------------------+

Task 1 – VLANの作成
~~~~~~~~~~~~~~~~~~~~~

.. NOTE:: このラボではVLANタグを設定する方法を説明しますが、タグ付きインターフェイスは展開しません。タグ付きインターフェイスを使用するには、``tagged``属性の値を``true``にする必要があります。

VLANオブジェクト/リソースを設定するには、次の手順を実行します：

#. Postman collection内の“Lab 1.4 – Basic Network Connectivity”フォルダを展開します。

#. Collection内の“Step 1: Create a VLAN”をクリックします。 JSONボディを確認し、‘Internal’のVLANを作成するための値はすでに設定されていることを確認します。

#. VLANを作成するには、‘Send’ボタンをクリックします。

#. 手順1を繰り返します。ただし、今回はJSONボディを変更し、上記の表のパラメータを使用して‘External’のVLANを作成します。

#. Collection内の“Step 2: Get VLANs”をクリックします。VLAN Collectionを取得するには‘Send’ボタンをクリックしてください。応答を確認し、両方のVLANが作成されていることを確認します。

Task 2 – Self IPの作成
~~~~~~~~~~~~~~~~~~~~~~~~

Self IP オブジェクト/リソースを設定するには、次の手順を実行します:

#. Collection内の“Step 3: Create a Self IP”をクリックします。JSONボディを確認し、‘Self-Internal’のSelf IPを作成するための値はすでに設定されていることを確認します。

#. Self IPを作成するには、‘Send’ボタンをクリックします。

#. 手順1を繰り返します。ただし、今回はJSONボディを変更し、上記の表のパラメータを使用して‘Self-External’のSelf IPを作成します。

#. Collection内の“Step 4: Get Self IPs”をクリックします。Self IP　Collectionを取得するには‘Send’ボタンをクリックしてください。応答を確認し、両方のSelf IPが作成されていることを確認します。

Task 3 – Route作成
~~~~~~~~~~~~~~~~~~~~~~

Routeオブジェクト/リソースを設定するには、次の手順を実行します:

#. Collection内の“Step 5: Create a Route”をクリックします。JSONボディを確認し、Default Routeを作成するための値はすでに設定されていることを確認します。

#. Routeを作成するには、‘Send’ボタンをクリックします。

#. Collection内の“Step 6: Get Routes”をクリックします。Routes Collectionを取得するには‘Send’ボタンをクリックしてください。応答を確認し、routeが作成されていることを確認します。
