<?php

declare(strict_types=1);

namespace App\Exception;

class ManagerException extends \Exception
{
    private readonly \DateTime $createdAt;

    public function __construct(
        $message = "",
        $code = ExceptionStatus::MANAGER_EXCEPTION,
        \Exception $previous = null,
        $customData = null
    ) {
        parent::__construct($message, $code, $previous);
        $this->createdAt = new \DateTime();
    }

    public function getCreatedAt(): \DateTime
    {
        return $this->createdAt;
    }
}
