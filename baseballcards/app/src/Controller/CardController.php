<?php

namespace App\Controller;

use App\Entity\Card;
use App\Resolver\CardResolver;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

final class CardController extends AbstractController
{
    public function getCards(CardResolver $resolver): JsonResponse
    {
        $cards = $resolver->resolveAllCards();

        return $this->json($cards, Response::HTTP_OK, [], ['groups' => 'API.GET']);
    }

    public function showCard(Request $request, CardResolver $resolver): JsonResponse
    {
        $card = $resolver->findCardById($request->get('id'));

        return $this->json($card, Response::HTTP_OK, [], ['groups' => 'API.GET']);
    }

    public function addCard(Request $request, CardResolver $resolver, SerializerInterface $serializer): JsonResponse
    {
        $data = $serializer->deserialize($request->getContent(), Card::class, 'json');
        $cards = $resolver->addCard($data);

        return $this->json($cards, Response::HTTP_CREATED, [], ['groups' => 'API.GET']);
    }



    public function editCard(Request $request, CardResolver $resolver, SerializerInterface $serializer): JsonResponse
    {
        $cardId = $request->get('id');
        $data = $serializer->deserialize($request->getContent(), Card::class, 'json');

        try {
            $resolver->editCard($cardId, $data);

            return $this->json([
                'message' => 'Card updated successfully'
            ], Response::HTTP_OK);
        } catch (\Exception $e) {
            return $this->json([
                'status' => 'error',
                'message' => $e->getMessage()
            ], Response::HTTP_NOT_FOUND);
        }
    }


    public function deleteCard(Request $request, CardResolver $resolver): JsonResponse
    {
        $cardId = $request->get('id');
        if (!$cardId) {
            return $this->json(['error' => 'Card ID is required'], Response::HTTP_BAD_REQUEST);
        }
        $card = $resolver->findCardById($cardId);
        if (!$card) {
            return $this->json(['error' => 'Card not found'], Response::HTTP_NOT_FOUND);
        }
        $resolver->deleteCard($cardId);

        return $this->json('Card deleted successfully', Response::HTTP_OK);
    }
}
