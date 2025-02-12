<?php

declare(strict_types=1);

namespace App\Manager;

use App\Entity\Card;
use App\Repository\CardRepository;
use App\Message\BaseballCardMessage;

class CardManager extends AbstractManager
{


    /**
     * @return CardRepository
     */
    private function getCardRepository(): CardRepository
    {
        return $this->em->getRepository(Card::class);
    }


    public function findAll(): array
    {
        return $this->getCardRepository()->findAll();
    }

    public function addCard(Card $newCard): array
    {
        $card = new Card();
        $card->setName($newCard->getName());
        $card->setPlayer($newCard->getPlayer());
        $card->setTeam($newCard->getTeam());
        $card->setYear($newCard->getYear());
        $card->setImageUrl($newCard->getImageUrl());
        $this->em->persist($card);
        $this->em->flush();
        $message = new BaseballCardMessage('card created');
        $this->messageBus->dispatch($message);
        return $this->findAll();
    }

    public function findCardById(string $cardId): Card
    {
        return $this->getCardRepository()->find($cardId);
    }

    public function editCard(string $cardId, Card $data): void
    {
        $card = $this->getCardRepository()->find($cardId);
        if ($data->getName() !== null) {
            $card->setName($data->getName());
        }
        if ($data->getPlayer() !== null) {
            $card->setPlayer($data->getPlayer());
        }
        if ($data->getTeam() !== null) {
            $card->setTeam($data->getTeam());
        }
        if ($data->getYear() !== null) {
            $card->setYear($data->getYear());
        }
        if ($data->getImageUrl() !== null) {
            $card->setImageUrl($data->getImageUrl());
        }
        $this->em->persist($card);
        $this->em->flush();
        $message = new BaseballCardMessage('card updated');
        $this->messageBus->dispatch($message);
    }



    public function deleteCard(string $cardId): void
    {
        $card = $this->getCardRepository()->find($cardId);
        $this->em->remove($card);
        $this->em->flush();
        $message = new BaseballCardMessage('card deleted');
        $this->messageBus->dispatch($message);
    }
}
