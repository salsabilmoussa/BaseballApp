<?php

declare(strict_types=1);

namespace App\Manager;

use App\Entity\EntityInterface;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;

interface ManagerInterface
{
    public function setEntityManager(EntityManagerInterface $em): void;

    public function setLogger(LoggerInterface $logger): void;

    public function save(EntityInterface $entity): EntityInterface;

    public function delete(EntityInterface $entity): void;
}
