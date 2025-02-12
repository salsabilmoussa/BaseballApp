<?php

namespace App\Resolver;

use App\Entity\Card;
use App\Manager\CardManager;

class CardResolver
{
    private CardManager $manager;

    public function __construct(CardManager $manager)
    {
        $this->manager = $manager;
    }

    public function resolveAllCards(): array
    {
        return $this->manager->findAll();
    }

    public function addCard(Card $newCard): array
    {
        $this->manager->addCard($newCard);
        return $this->manager->findAll();
    }

    public function findCardById(string $cardId): Card
    {
        return $this->manager->findCardById($cardId);
    }

    public function editCard(string $cardId, Card $data): void
    {
        $this->manager->editCard($cardId, $data);
    }

    public function deleteCard(string $cardId): void
    {
        $this->manager->deleteCard($cardId);
    }
}
