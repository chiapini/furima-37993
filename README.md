#　usersテーブル
|column                 |  type |  Options                 |
|-----------------------|-------|--------------------------|
|nickname               |string |null: false               |
|email                  |string |null: false, unique: true |
|password               |string |null: false               |
|first                  |string |null: false               |
|last                   |string |null: false               |
|first2                 |string |null: false               |
|last2                  |string |null: false               |
|Birthday               |date   |null: false               |

## association
has_many :items
has_many :purchases

#　itemsテーブル
|column           |  type      |  Options                      |
|-----------------|------------|-------------------------------|
|name             |string      |null: false                    |
|information      |text        |null: false                    |
|category_id      |integer     |null: false                    |
|situation_id     |integer     |null: false                    |
|delivery_id      |integer     |null: false                    |
|area_id          |integer     |null: false                    |
|jour_id          |integer     |null: false                    |
|price            |integer     |null: false                    |
|user             |references  |null: false, foreign_key: true |

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
|post_id            |integer      |null: false                    |
|area_id            |integer      |null:false                     |
|municipality       |string       |null:false                     |
|address            |string       |null:false                     |
|building           |string       |                               |
|phone              |integer      |null:false                     |
|purchase           |references   |null: false, foreign_key: true |

## association
belongs_to :purchase

