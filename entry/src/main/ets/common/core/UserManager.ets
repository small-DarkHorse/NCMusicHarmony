import { KEY_COOKIE, KVUtil } from 'lib_common'
import { KVConstants, STORAGE_USER_INFO } from '..'
import { UserInfoBean } from '../../bean'

export class UserManager {
  static async getUserInfo(): Promise<UserInfoBean> {
    const result = await KVUtil.get<UserInfoBean>(KVConstants.KEY_USER_INFO)
    return result
  }

  static async setUserInfo(userInfo: UserInfoBean) {
    AppStorage.Set(STORAGE_USER_INFO, userInfo)
    await KVUtil.putString(KVConstants.KEY_USER_INFO, JSON.stringify(userInfo))
    await KVUtil.putString(KEY_COOKIE, userInfo.cookie)
  }
}