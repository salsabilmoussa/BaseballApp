<?php

namespace App\Message;

use App\Message\BaseballCardMessage;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;

#[AsMessageHandler]
class BaseballCardMessageHandler
{
    public function __invoke(BaseballCardMessage $message)
    {
        echo "Message reçu : " . $message->getContent() . PHP_EOL;
    }
}
