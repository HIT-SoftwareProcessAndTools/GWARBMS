package cn.edu.hit.spat.common.authentication;

import cn.edu.hit.spat.common.annotation.Helper;
import org.apache.shiro.authz.AuthorizationInfo;

/**
 * @author MrBird
 */
@Helper
public class ShiroHelper extends ShiroRealm {

    /**
     * 获取当前用户的角色和权限集合
     *
     * @return AuthorizationInfo
     */
    public AuthorizationInfo getCurrentUserAuthorizationInfo() {
        return super.doGetAuthorizationInfo(null);
    }
}
