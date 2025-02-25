<?php

namespace App\Security;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationSuccessHandlerInterface;

class AdminAuthenticatorSuccessHandler implements AuthenticationSuccessHandlerInterface
{
    private $jwtManager;

    public function __construct(JWTTokenManagerInterface $jwtManager)
    {
        $this->jwtManager = $jwtManager;
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token): JsonResponse
    {
        $user = $token->getUser();

        if (!in_array("ROLE_ADMIN", $user->getRoles())) {
            return new JsonResponse(['error' => 'seuls les admin peuvent se connecter ici.'], JsonResponse::HTTP_FORBIDDEN);
        }

        $jwt = $this->jwtManager->create($user);

        return new JsonResponse(['token' => $jwt]);
    }
}
