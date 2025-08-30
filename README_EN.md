[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Oswald&weight=700&size=25&duration=1500&pause=1&color=F70000&background=100BFF00&multiline=true&repeat=false&width=435&height=80&lines=EnJoyTheVR;Application+Template)](https://git.io/typing-svg)
<br/>
[Example apps](https://github.com/Zhes-20/EnJoyTheVR/tree/main/Assets/Scenes)<br/>
[Video guide for creating applications](https://youtu.be/Wr2Y20zpuxc)<br/>
[Video guide for creating multiplayer applications](https://youtu.be/gp93QRKY9Ic)

If you want to create an application for EnJoyTheVR, send a direct message to the [VK group](https://vk.com/enjoythevr) or open an Issue in the GitHub repository. Once your application idea is approved, a personal developer version of EnJoyTheVR will be provided to you.

---

## How to Create Your Own Application for EnJoyTheVR

1. **Download the Unity project.**

2. **Create a new scene.** If it’s the initial scene, name it the same as your game. *(Only lowercase letters are allowed.)*

3. **Fill in the bundle name in the inspector.** This will be your game’s name. *(This bundle must be specified for all subsequent scenes.)*

   ![AssetBundle](https://github.com/user-attachments/assets/3a467aa2-a898-4c05-b24b-b7e9dc85ab12)

4. **Create an empty GameObject and name it “spawn.”** This will be the spawn point for the player.

---

## How to Write Scripts?

Creating a game for EnJoyTheVR is similar to creating a standard Unity game; however, due to Unity’s AssetBundle limitations, scripts must be written in Lua. However, the project already contains some assets that can be used as a ready-made solution for some solutions (their use is allowed only for developing applications for EnJoyTheVR).

### Using CustomLuaLoader

To use Lua scripts, add the `CustomLuaLoader.cs` script to the desired GameObject and fill in the fields:

- **CustomModeDirectory** — Your game’s name.
- **LuaScriptName** — The name of the script to be used.
- **Injections** — Objects that need to be passed to the script for further use.

   ![CustomLuaLoader](https://github.com/user-attachments/assets/5c0f25b7-eebc-4c83-b907-6d89a4d29edd)

   - **Name** — The object’s name to be used in your script.
   - **Value** — The object to be passed.

Lua scripts are located at the following path: `Application.persistentDataPath, "CustomModes", customModeDirectory, "Resources", luaScriptName`. *(This path will be displayed in the Debug log at startup.)*

To call a function externally, use the method `CustomLuaLoader.InvokeLuaFunction` and specify the function’s name:

![InvokeFunction](https://github.com/user-attachments/assets/38d1bcf6-5a2d-4a48-a9a6-9edea968f751)

---

## How to Build Your Game?

1. Click the **Build AssetBundles** button:

   ![BuildAssetBundles](https://github.com/user-attachments/assets/539cf9e4-2b59-4e57-9f1d-a64bd3af27e6)

---

## Game Format

The game should follow this format:

- Folder named after your game
  - AssetBundle files
  - Cover image named `logo.png`
  - `Resources` folder
    - Lua scripts

![GameFormat](https://github.com/user-attachments/assets/2f58c45f-68f5-4fc6-be04-ac58d0542865)

---

## Testing on Devices

### Android
Move the game to the following path:  
`Android/data/com.Zhes.EnJoyTheVR/files/CustomModes/`

### iOS
Move the game to the following path:  
`On iPhone/EnJoyTheVR/CustomModes/`

---

## EnJoyTheVR API: EVR.API

To use the API, add the prefab named **EVR.API** to the first scene of your application.

![Prefab1](https://github.com/user-attachments/assets/ee0e6c3a-678a-4d28-b80b-565fdeced2fb)
![Prefab2](https://github.com/user-attachments/assets/6c91332b-34d9-4226-a16e-683ac758dd3c)

### API Description

#### EVR.Player
Returns the player GameObject.

**Example:**
```lua
local player = EVR.Player
function Start()
    player:GetComponent("Transform").position = Vector3(0, 0, 0)
end
```

#### EVR:Save(string, value)
Saves a value in the PlayerPrefs system using the specified key.

**Example:**
```lua
function Start()
    EVR:Save("Name", "John")
    EVR:Save("Score", 100)
    EVR:Save("IsAlive", true)
end
```

#### EVR:Load(string, string)
Loads a saved value from PlayerPrefs using the specified key.

**Example:**
```lua
local playerName = EVR:Load("Name", "string")
local score = EVR:Load("Score", "int")
local isAlive = EVR:Load("IsAlive", "bool")
```

#### EVR:SetTime(float)
Sets the time scale in the game, changing its speed.

**Example:**
```lua
function Start()
    EVR:SetTime(0.2)
end
```

#### EVR:CloseApp()
Closes the application, returning the player to the main lobby.

**Example:**
```lua
function Update()
    if CS.UnityEngine.Input.GetKey(CS.UnityEngine.KeyCode.Return) then
        EVR:CloseApp()
        CS.UnityEngine.Debug.Log("AppWasClosed")
    end
end
```

#### EVR:LoadScene(string, bool)
Loads a scene from an AssetBundle. Arguments:
- `string` — Scene name.
- `bool` — Whether to keep the previous scene loaded.

**Example:**
```lua
function Start()
    EVR:LoadScene("TestScene", true)
    CS.UnityEngine.Debug.Log("TestScene Loaded")
end
```

#### EVR:SetHeadBasicPosition(Transform HeadObject) 
Changes the "zero position" of the head to the specified position.

**Example:**
```lua
function Start()
    EVR:SetHeadBasicPosition(object:GetComponent("Transform"))
end
```

#### EVR:SetHeadBasicStandartPosition() 
Resets the "zero position" of the head to the standard position.

**Example:**
```lua
function Start()
    EVR:SetHeadBasicStandartPosition()
end
```

#### EVR:SetPlayerCollider(float Height = 2.0, float Radius = 0.1)
Changes the collider of the main player.

**Example:**
```lua
function Start()
    EVR:SetPlayerCollider(5.5, 1.5)
end
```

#### EVR:DoJump()
Since jumping is not a natural action in VR, this feature is separated into a dedicated method.

**Example:**
```lua
function Start()
    EVR:DoJump()
end
```

#### EVR:SetJumpForce(float JF = 3f) 
Changes the jump strength (height) of the player.

**Example:**
```lua
function Start()
    EVR:SetJumpForce(10.5) 
end
```

#### EVR:SetPlayerSpeed(float movementSpeed = 3.0f, float strafeSpeed = 3.0f) 
Changes the movement speed of the player.

**Example:**
```lua
function Start()
    EVR:SetPlayerSpeed(10.5, 8.5) 
end
```

#### EVR:SetNewHandL(GameObject)
Replaces the left hand GameObject. If the object is not passed, it disables the hand model. (The standard hand model is disabled, the functions remain, if necessary, block the standard input, see BlockInput)

**Example:**
```lua
local object = someGameObject
function Start()
    EVR:SetNewHandL(object)
end
```

#### EVR:SetNewHandR(GameObject)
Replaces the right hand GameObject. If the object is not passed, it disables the hand model. (The standard hand model is disabled, the functions remain, if necessary, block the standard input, see BlockInput)

**Example:**
```lua
local object = someGameObject
function Start()
    EVR:SetNewHandR(object)
end
```

#### EVR:SetNewHead(GameObject)
Replaces the head model with the passed GameObject. If the object is not passed, it disables the head model.
**Example:**
```lua
local object = someGameObject
function Start()
    EVR:SetNewHead(object)
end
```
#### EVR:SetStandartHead()
Returns the player's standard head.

**Example:**
```lua
EVR:SetStandartHead()
```

#### EVR:BlockInput()
Blocks standard hand control (buttons).

**Example:**
```lua
EVR:BlockInput()
```

#### EVR:UnblockInput()
Unblocks standard hand control (buttons).

**Example:**
```lua
EVR:UnblockInput()
```

#### EVR:BlockStick()
Blocks standard movement (stick).

**Example:**
```lua
EVR:BlockStick()
```

#### EVR:UnblockStick()
Unblocks standard movement (stick).

**Example:**
```lua
EVR:UnblockStick()
```

#### EVR:SetStandardHandL()
Returns the default left hand.

**Example:**
```lua
EVR:SetStandardHandL()
```

#### EVR:SetStandardHandR()
Returns the default right hand.

**Example:**
```lua
EVR:SetStandardHandR()
```

#### EVR:EnableKeyboard(TMP_InputField)
Turns on the keyboard, specifies the InputField for which input is required.

**Example:**
```lua
EVR:EnableKeyboard(InputField)
```

#### EVR:DisableKeyboard()
Turns off the keyboard.

**Example:**
```lua
EVR:DisableKeyboard()
```

#### EVR:BKeyCode()
Returns the KeyCode for the "B" button on the controller.<br/>
(Similar functions are available for AKeyCode(), XKeyCode(), YKeyCode(), RStickButtonKeyCode(), LStickButtonKeyCode(), RKeyCode(), LKeyCode(), ZRKeyCode(), ZLKeyCode(), UPKeyCode(), DownKeyCode(), LeftKeyCode(), and RightKeyCode()). /left stick - "Horizontal"/"Vertical", right stick - "HorizontalRight"/"VerticalRight"/

**Example:**
```lua
local BKeyCode = EVR:BKeyCode()

if CS.UnityEngine.Input.GetKey(BKeyCode) then
   CS.UnityEngine.Debug.Log("B Button Pressed")
end
```

#### EVR:EnableLoading()
Enables loading screen.

**Example:**
```lua
EVR:EnableLoading()
```

#### EVR:DisableLoading()
Disables loading screen.

**Example:**
```lua
EVR:DisableLoading()
```



---

## Multiplayer: EVRPhoton

Multiplayer applications in EnJoyTheVR are built on [Photon 2](https://www.photonengine.com). To use EVRPhoton, you need to place the prefab named **EVRPhoton** in every scene of your application where Photon functions are utilized.

<img width="80" alt="Screenshot 2025-01-20 at 00:36:44" src="https://github.com/user-attachments/assets/99e8c0f7-c6ef-4d30-bec6-dbcd3e361d32" />

To connect to PhotonNetwork, use the "PhotonSetConnection.cs" script. Attach it to any object in your starting scene, configure the required settings, and specify the application ID in the App Id Realtime field from your [PhotonEngine](https://dashboard.photonengine.com) account.

The project also includes auxiliary scripts that would be difficult to implement in Lua:

- **EVRPhotonObjSync.cs** - Attach this to any object whose methods you want to synchronize. (See API description below.)
- **EVRPhotonServerList.cs** - Designed to work with the list of created rooms. Requires `serverPanelPrefab` and `contentParent` to be specified.
- **EVRPhotonServerPanel.cs** - Used to define the `serverPanelPrefab` in the **EVRPhotonServerList.cs** script. Requires the following fields to be set: `TMP_Text roomNameText` and `TMP_Text playerCountText`.

### API Description

#### EVRPhoton:RegisterInPool(string name, bool needDestroy = false)
Registers objects in a pool for future use in multiplayer. This should be done in the **function Start()** of your starting scene.

**Example:**
```lua
function Start()
    EVRPhoton:RegisterInPool("Cube")
    EVRPhoton:RegisterInPool("LHand")
    EVRPhoton:RegisterInPool("RHand")
    EVRPhoton:RegisterInPool("Pistol")
end
```

#### EVRPhoton:CreateRoom(string name, string MapName = null)
Creates a room and optionally loads a scene with the specified `MapName` (if `MapName` is not provided, no scene is loaded).

**Example:**
```lua
EVRPhoton:CreateRoom(name, "Game")
```

#### EVRPhoton:JoinRoom(string name, string MapName = null)
Joins an existing room and optionally loads a scene with the specified `MapName` (if `MapName` is not provided, no scene is loaded).

**Example:**
```lua
function JoinRoomBut()
    local name = Text:GetComponent("TMPro.TextMeshProUGUI").text
    EVRPhoton:JoinRoom(name, "Game")
end
```

#### EVRPhoton:LeaveRoom(string MapName = null)
Leaves the current room and optionally loads a scene with the specified `MapName` (if `MapName` is not provided, no scene is loaded).

**Example:**
```lua
EVRPhoton:LeaveRoom("lobby")
```

#### EVRPhoton:DisconnectFromMaster()
Disconnects from PhotonNetwork.

**Example:**
```lua
EVRPhoton:DisconnectFromMaster()
```

#### EVRPhoton:Instantiate(string name, Vector3 vector, Quaternion quaternion)
Instantiates a registered object from the pool at the specified coordinates.

**Example:**
```lua
function Start()
    EVRPhoton:Instantiate("Cube", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("LHand", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("RHand", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
end
```

#### EVRPhoton:SetOwnership(GameObject targetObject)
Transfers ownership of a GameObject to the local player.

**Example:**
```lua
EVRPhoton:SetOwnership(pistol)
```

#### EVRPhoton:Sync(GameObject targetObject, string scriptName, string methodName, string parameters = null)
Synchronizes the execution of a specific method on a specific object among players. The object must have the "EVRPhotonObjSync.cs" script attached.

**Example:**
```lua
EVRPhoton:Sync(pistol, "gun", "shoot")
```

#### EVRPhoton:CheckIfMaster()
Updates the `EVRPhoton.IsMaster` variable.

**Example:**
```lua
function Start()
    EVRPhoton:CheckIfMaster()
    if EVRPhoton.IsMaster == true then
        EVRPhoton:Instantiate("Box", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    end
end
```

#### EVRPhoton.NickName
Returns current player's nickname (PhotonNetwork)
**Пример:**
```lua
function Start()
    CS.UnityEngine.Debug.Log(EVRPhoton.NickName)
end
```

#### EVRPhoton:SetNickName(string)
Sets new nickname (PhotonNetwork)
**Пример:**
```lua
function Start()
    EVRPhoton:SetNickName("NickName")
end
```
