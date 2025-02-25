<?php

declare(strict_types=1);

namespace App\Exception;

enum ExceptionStatus: int
{
    case MANAGER_EXCEPTION = 1000;
    case REPOSITORY_EXCEPTION = 2000;
    case SERIALIZER_EXCEPTION = 3000;
}
