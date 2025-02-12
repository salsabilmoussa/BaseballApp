<?php

declare(strict_types=1);

namespace App\Manager;

use App\Entity\User;
use App\Repository\UserRepository;

class UserManager extends AbstractManager
{
    /**
     * @return UserRepository
     */
    private function getUserRepository(): UserRepository
    {
        return $this->em->getRepository(User::class);
    }
}
