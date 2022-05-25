#　usersテーブル
|column                 |  type |  Options                 |
|-----------------------|-------|--------------------------|
|nickname               |string |null: false               |
|email                  |string |null: false, unique: true |
|encrypted_password     |string |null: false               |
|name1                  |string |null: false               |
|name2                  |string |null: false               |
|Birthday               |string |null: false               |

## association
has_many :items
has_many :purchases

#　itemsテーブル
|column        |  type      |  Options                      |
|--------------|------------|-------------------------------|
|Name          |string      |null: false                    |
|Text          |text        |null: false                    |
|Category      |string      |null: false                    |
|Situation     |string      |null: false                    |
|Delivery      |string      |null: false                    |
|Area          |string      |null: false                    |
|Dates         |string      |null: false                    |
|Price         |string      |null: false                    |
|user          |references  |null: false, foreign_key: true |

## association
belongs_to :user
has_one :purchase

# purchaseテーブル
|user          |references  |null: false, foreign_key: true |
|item          |references  |null: false, foreign_key: true |

## association
belongs_to :user
belongs_to :item
has_one :address

# addressテーブル
|column             | type        |  Options                      |
|-------------------|-------------|-------------------------------|
|post               |string       |null: false                    |
|prefecture         |string       |null:false                     |
|municipality       |string       |null:false                     |
|address            |string       |null:false                     |
|building           |string       |                               |
|phone              |string       |null:false                     |
|purchase           |references   |null: false, foreign_key: true |

## association
belongs_to :purchase

