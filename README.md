# DataBase
***

# <u> 1. Userモデル </u>

| column   | type    | option         |
|:---------|:--------|:---------------|
| name     | string  | null: false    |
| email    | string  | null: false    |
| password | string  | null: false    |

###Association
- has_many :messages
- has_many :groupusers
- has_many :groups, through: :groupusers

***

# <u> 2. Groupsモデル </u>

| column     | type       | option         |
|:-----------|:-----------|:---------------|
| name       | string     | null: false    |
| user       | references | null: false    |
| created_at |            | null: false    |
| updated_at |            | null: false    |

###Association
- has_many :messages
- has_many :groupusers
- has_many :users, through: :groupusers

***

# <u> 3. Messageモデル </u>
| column   | type        | option         |
|:---------|:------------|:---------------|
| body     | text        | null: false    |
| image    | string      | null: false    |
| group_id | references  |                |
| user_id  | references  |                |

###Association
- belongs_to :user
- belongs_to :group

***

# <u> 4. GroupsUsersモデル </u>

| column   | type        | option         |
|:---------|:------------|:---------------|
| group_id | references  |                |
| user_id  | references  |                |

###Association
- belongs_to :user
- belongs_to :group
