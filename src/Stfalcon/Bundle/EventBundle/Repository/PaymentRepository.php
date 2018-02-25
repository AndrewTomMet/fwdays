<?php

namespace Stfalcon\Bundle\EventBundle\Repository;

use Doctrine\ORM\EntityRepository;

use Application\Bundle\UserBundle\Entity\User;
use Stfalcon\Bundle\EventBundle\Entity\Event;
use Stfalcon\Bundle\EventBundle\Entity\Payment;

/**
 * PaymentsRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class PaymentRepository extends EntityRepository
{
    /**
     * Find paid payments user
     *
     * @param User $user
     *
     * @return array
     */
    public function findPaidPaymentsForUser(User $user)
    {
        $qb = $this->createQueryBuilder('p');
        $query = $qb->leftJoin('p.tickets', 't')
            ->leftJoin('t.event', 'e')
            ->andWhere('e.useDiscounts = :useDiscounts')
            ->andWhere('t.user = :user')
            ->andWhere('p.status = :status')
            ->setParameter('user', $user)
            ->setParameter('useDiscounts', true)
            ->setParameter('status', Payment::STATUS_PAID)
            ->getQuery();

        return $query->getResult();
    }

    /**
     * Find paid payments user in payments
     *
     * @param User $user
     *
     * @return array
     */
    public function findPaidPaymentsForUserInPayment(User $user)
    {
        $qb = $this->createQueryBuilder('p');
        $query = $qb->leftJoin('p.tickets', 't')
            ->leftJoin('t.event', 'e')
            ->andWhere('e.useDiscounts = :useDiscounts')
            ->andWhere('p.user = :user')
            ->andWhere('p.status = :status')
            ->setParameter('user', $user)
            ->setParameter('useDiscounts', true)
            ->setParameter('status', Payment::STATUS_PAID)
            ->getQuery();

        return $query->getResult();
    }
    /**
     * @param User  $user
     * @param Event $event
     *
     * @return Payment|null
     */
    public function findPaymentByUserAndEvent(User $user, Event $event)
    {
        $qb = $this->createQueryBuilder('p');
        $query = $qb->leftJoin('p.tickets', 't')
            ->where('t.event = :event')
            ->andWhere($qb->expr()->eq('p.user', ':user'))
            ->andWhere($qb->expr()->eq('p.state', ':state'))
            ->setParameter('user', $user)
            ->setParameter('event', $event)
            ->setParameter('state', Payment::STATUS_PENDING)
            ->setMaxResults(1)
            ->getQuery();

        return $query->getOneOrNullResult();
    }
}
