// 设备属性
export interface DeviceProperty {
  endpoint_app: String
  endpoint_device: String
  project_id: string
  device_id: string
  service_id: string
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 命令体
export interface CommandBody {
  service_id: string
  command_name: string
  paras: Paras
}

// 命令参数
type Paras = Record<string, boolean>;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 设备影子
export interface DeviceShadow {
  soilHumidity: string
  luminance: string
  pumpStatus: string
  shedStatus: string
  workStatus: string
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 获取access_token时的验证信息
export interface Verification {
  device_id: string
  sign_type: number
  timestamp: string
  password: string
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IAM 用户信息
export interface IAM_User {
  username: string
  password: string
}

export interface HW_User {
  auth: Auth;
}

interface Auth {
  identity: Identity;
  scope: Scope;
}

interface Identity {
  methods: string[];
  password: Password;
}

interface Password {
  user: User;
}

interface User {
  name: string;
  password: string;
  domain: Domain;
}

interface Domain {
  name: string;
}

interface Scope {
  domain: Domain
}