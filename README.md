# DataBase
***

# <u> 1. Usersテーブル </u>

| column   | type    | option         |
|:---------|:--------|:---------------|
| name     | string  | null: false    |
| email    | string  | null: false    |
| password | string  | null: false    |

###Association
- has_many :messages
- has_many :group_users
- has_many :groups, through: :group_users

***

# <u> 2. Groupsテーブル </u>

| column     | type       | option         |
|:-----------|:-----------|:---------------|
| name       | string     | null: false    |


###Association
- has_many :messages
- has_many :group_users
- has_many :users, through: :group_users

***

# <u> 3. Messagesテーブル </u>
| column   | type        | option         |
|:---------|:------------|:---------------|
| body     | text        | null: false    |
| image    | string      |                |
| group_id | references  |                |
| user_id  | references  |                |

###Association
- belongs_to :user
- belongs_to :group

***

# <u> 4. GroupsUsersテーブル </u>

| column   | type        | option         |
|:---------|:------------|:---------------|
| group_id | references  |                |
| user_id  | references  |                |

###Association
- belongs_to :user
- belongs_to :group
