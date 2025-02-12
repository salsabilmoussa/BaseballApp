<?php

declare(strict_types=1);

namespace App\Manager;

use App\Exception\ExceptionStatus;
use App\Exception\ManagerException;
use App\Entity\EntityInterface;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;

class AbstractManager implements ManagerInterface
{
    protected EntityManagerInterface $em;
    protected LoggerInterface $logger;

    public function __construct(EntityManagerInterface $em, LoggerInterface $logger)
    {
        $this->em = $em;
        $this->logger = $logger;
    }

    /**
     * @param EntityManagerInterface $em
     * @return void
     */
    public function setEntityManager(EntityManagerInterface $em): void
    {
        $this->em = $em;
    }

    /**
     * @param LoggerInterface $logger
     * @return void
     */
    public function setLogger(LoggerInterface $logger): void
    {
        $this->logger = $logger;
    }

    /**
     * @param EntityInterface $entity
     * @return EntityInterface
     * @throws ManagerException
     */
    public function save(EntityInterface $entity): EntityInterface
    {
        $this->em->persist($entity);

        try {
            $this->em->flush();
            return $entity;
        } catch (\Exception $exception) {
            $this->logger->critical(sprintf('TRANSACTIONAL ERROR ON SAVE: %s', $exception->getMessage()));

            throw new ManagerException($exception->getMessage(), ExceptionStatus::MANAGER_EXCEPTION->value, $exception);
        }
    }

    /**
     * @param EntityInterface $entity
     * @return void
     * @throws ManagerException
     */
    public function delete(EntityInterface $entity): void
    {
        try {
            $this->em->remove($entity);
            $this->em->flush();
        } catch (\Exception $exception) {
            $this->logger->critical(sprintf('TRANSACTIONAL ERROR ON DELETE: %s', $exception->getMessage()));
            throw new ManagerException($exception->getMessage(), ExceptionStatus::MANAGER_EXCEPTION, $exception);
        }
    }
}
