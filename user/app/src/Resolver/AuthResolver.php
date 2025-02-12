<?php

declare(strict_types=1);

namespace App\Resolver;

use App\Entity\User;
use App\Manager\UserManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AuthResolver
{
    private UserManager $manager;
    private $passwordHasher;

    public function __construct(UserManager $manager, UserPasswordHasherInterface $passwordHasher)
    {
        $this->manager = $manager;
        $this->passwordHasher = $passwordHasher;
    }

    public function registerUser(User $user): User
    {
        $hashedPassword = $this->passwordHasher->hashPassword($user, $user->getPassword());
        $user->setPassword($hashedPassword);
        $this->manager->save($user);

        return $user;
    }
}
