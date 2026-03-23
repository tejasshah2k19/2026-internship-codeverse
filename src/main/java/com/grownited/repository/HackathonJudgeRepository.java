package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.HackathonJudgeEntity;

@Repository
public interface HackathonJudgeRepository extends JpaRepository<HackathonJudgeEntity, Integer> {

	List<HackathonJudgeEntity> findByHackathonId(Integer hackathonId);

	List<HackathonJudgeEntity> findByUserId(Integer userId);

	boolean existsByHackathonIdAndUserId(Integer hackathonId, Integer userId);
}
