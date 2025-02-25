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
        $this->save($newCard);
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
        $this->save($card);
        $message = new BaseballCardMessage('card updated');
        $this->messageBus->dispatch($message);
    }



    public function deleteCard(string $cardId): void
    {
        $card = $this->getCardRepository()->find($cardId);
        $this->delete($card);
        $message = new BaseballCardMessage('card deleted');
        $this->messageBus->dispatch($message);
    }

    public function searchCards(string $searchQuery): array
    {
        $qb = $this->em->createQueryBuilder()
            ->select('c')
            ->from(Card::class, 'c')
            ->where('LOWER(c.name) LIKE :search')
            ->orWhere('LOWER(c.player) LIKE :search')
            ->orWhere('LOWER(c.team) LIKE :search');
        if (is_numeric($searchQuery)) {
            $qb->orWhere('c.year = :year')
                ->setParameter('year', (int) $searchQuery);
        }
        $qb->setParameter('search', '%' . strtolower($searchQuery) . '%');

        return $qb->getQuery()->getResult();
    }
}
