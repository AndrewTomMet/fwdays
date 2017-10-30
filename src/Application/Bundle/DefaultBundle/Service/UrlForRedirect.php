<?php

namespace Application\Bundle\DefaultBundle\Service;

use JMS\I18nRoutingBundle\Router\I18nRouter;

class UrlForRedirect
{
    /** @var I18nRouter $router */
    protected $router;

    /** @var $homePages */
    private $homePages = [];
    private $authorizationUrls = [];
    private $cabinetUrl;
    /**
     * GetUrlForRedirect constructor.
     * @param I18nRouter $router
     * @param array      $locales
     */
    public function __construct($router, $locales)
    {
        $this->router = $router;

        $this->authorizationUrls[] = $this->router->generate('fos_user_security_login', [], true);
        $this->authorizationUrls[] = $this->router->generate('fos_user_registration_register', [], true);
        $this->authorizationUrls[] = $this->router->generate('fos_user_resetting_check_email', [], true);
        $this->authorizationUrls[] = $this->router->generate('fos_user_resetting_send_email', [], true);

        $this->homePages[] = trim($router->generate('homepage', [], true), '\/');
        foreach ($locales as $locale) {
            $this->homePages[] = $router->generate('homepage', ['_locale' => $locale], true);
            $this->authorizationUrls[] = $this->router->generate('fos_user_registration_register', ['_locale' => $locale], true);
            $this->authorizationUrls[] = $this->router->generate('fos_user_resetting_check_email', ['_locale' => $locale], true);
            $this->authorizationUrls[] = $this->router->generate('fos_user_resetting_send_email', ['_locale' => $locale], true);
        }
    }

    /**
     * get redirect url for referral url
     *
     * @param string $referralUrl
     *
     * @return string
     */
    public function getRedirectUrl($referralUrl)
    {
        $clearReferrer = trim(preg_replace('/(\?.*)/', '', $referralUrl), '\/');
        if (in_array($clearReferrer, $this->homePages)) {
            return $this->router->generate('cabinet');
        }

        if (in_array($clearReferrer, $this->authorizationUrls)) {
            return $this->router->generate('homepage');
        }

        return $referralUrl;
    }
}