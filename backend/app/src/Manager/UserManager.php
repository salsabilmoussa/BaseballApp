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

    public function findAll(): array
    {
        return $this->getUserRepository()->findAll();
    }

    public function searchUsers(string $searchQuery): array
    {
        $qb = $this->em->createQueryBuilder()
            ->select('c')
            ->from(User::class, 'c')
            ->where('LOWER(c.name) LIKE :search')
            ->orWhere('LOWER(c.email) LIKE :search')
            ->setParameter('search', '%' . strtolower($searchQuery) . '%');

        return $qb->getQuery()->getResult();
    }
}
