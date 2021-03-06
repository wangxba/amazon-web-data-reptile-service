package org.framework.core.global.service.impl;

import com.amazon.admin.account.entity.AdminSystemEntity;
import com.amazon.admin.constant.Constants;
import com.amazon.author.account.entity.AuthorUserEntity;
import com.amazon.author.common.constant.AuthorConstant;
import com.amazon.buyer.account.entity.BuyerUserEntity;
import com.amazon.buyer.account.service.BuyerUserService;
import com.amazon.buyer.utils.BuyerConstants;
import com.amazon.service.user.controller.UserController;
import com.amazon.service.user.entity.UserEntity;
import com.amazon.system.Constant;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.framework.core.common.pojo.EmailCodePojo;
import org.framework.core.common.service.impl.BaseServiceImpl;
import org.framework.core.global.service.GlobalService;
import org.framework.core.utils.ContextHolderUtils;
import org.framework.core.utils.MailUtils;
import org.framework.core.utils.OrderNumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by User on 2017/6/10.
 */
@Service("globalService")
@Transactional
public class GlobalServiceImpl extends BaseServiceImpl implements GlobalService {

    private static Logger logger = LogManager.getLogger(GlobalServiceImpl.class.getName());

    public boolean sendEmail() throws Exception {
        return false;
    }

    public boolean sendEmailEmailCodePojo(EmailCodePojo emailCodePojo) {
        emailCodePojo.setSubject("Review Tracker找回密码，发送验证码！");
        emailCodePojo.setContent("您的验证码是" + emailCodePojo.getCode() + ",请在10分钟内使用该验证码完成密码修改！");
        try {
            MailUtils.sendEmail(emailCodePojo);
        } catch (Exception e) {
            logger.error(e.fillInStackTrace());
            return false;
        }
        return true;
    }

    public boolean sendEmailEmailBuyerCheckCodePojo(EmailCodePojo emailCodePojo) {
        emailCodePojo.setSubject("From Review Tracker,click the link to reset your password!");
        emailCodePojo.setContent("The link to reset your password is " + emailCodePojo.getCode() + ",Please complete the password reset in ten minutes ");
        try {
            MailUtils.sendEmail(emailCodePojo);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public UserEntity getUserEntityFromSession() {
        UserEntity userSession = (UserEntity) ContextHolderUtils.getSession().getAttribute(Constant.USER_SESSION_CONSTANTS);
        return userSession;
    }


    public String generateOrderNumber() {
        return OrderNumberUtils.generateOrderNumber();
    }


    public AdminSystemEntity getAdminEntityFromSession() {
        AdminSystemEntity AdminSystemSession = (AdminSystemEntity) ContextHolderUtils.getSession().getAttribute(Constants.ADMIN_SESSION_CONSTANTS);
        return AdminSystemSession;
    }

    public Boolean isNotAdminLogin() {
        if (getAdminEntityFromSession() == null) {
            return true;
        } else {
            return false;
        }
    }

    public BuyerUserEntity getBuyerUserEntityFromSession() {
        BuyerUserEntity buyerUserEntity = (BuyerUserEntity) ContextHolderUtils.getSession().getAttribute(BuyerConstants.BUYER_USER_SESSION_CONSTANTS);
        return buyerUserEntity;
    }

    public Boolean isNotBuyerUserLogin() {
        if (getBuyerUserEntityFromSession() == null){
            return true;
        } else {
            return false;
        }
    }

    public AuthorUserEntity getAuthorUserEntityFromSession() {
        AuthorUserEntity authorUserEntity = (AuthorUserEntity) ContextHolderUtils.getSession().getAttribute(AuthorConstant.AUTHOR_SESSION_CONSTANTS);
        return authorUserEntity;
    }
}
