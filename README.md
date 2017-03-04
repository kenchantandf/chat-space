# <u> 1. Userモデル </u>

### Association
<!--   - has_many :messages
  - has_and_belongs_to_many :groups -->
  -has_many: messages


  ###  Columns
    - name :string, null: false
    - email :string, null: false, unique: true
    - password :string, null: false
<!--     - has_and_belongs_to_many :user -->
    - has_many :messages
<!--     - has_many :messages -->
    - created_at
    - updated_at

***

# <u> 2. Groupsモデル </u>

### Association
    -has_many: messages, through: users

 ### Columns
  -name: string, null: false
  -user :reference
  -created_at
  -updated_at


# <u> 3. GroupsUsersモデル </u>
######(Groups_Usersモデル)

  ### Columns
    - user :references
    - group :references

***

# <u> 4. Messageモデル </u>

### Association
  - belongs_to :user
  - belongs_to :group


  ### Columns
    - body :text
    - image :string
    - user :references
    - group :references
    - created_at
    - updated_at
