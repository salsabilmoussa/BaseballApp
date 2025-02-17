<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\User;
use App\Resolver\AuthResolver;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\Serializer\SerializerInterface;

final class AuthController extends AbstractController
{
    public function register(Request $request, AuthResolver $resolver, SerializerInterface $serializer, ValidatorInterface $validator): JsonResponse
    {
        $user = $serializer->deserialize($request->getContent(), User::class, 'json');

        $violations = $validator->validate($user);
        if (count($violations) > 0) {

            return $this->json($violations, Response::HTTP_BAD_REQUEST);
        }

        return $this->json(
            [
                'user' => $resolver->registerUser($user),
                'message' => 'User registered successfully !'
            ],
            Response::HTTP_CREATED,
            []
        );
    }

}
