package model

import "go.mongodb.org/mongo-driver/bson/primitive"

type Yoga struct {
	ID            primitive.ObjectID `json:"_id" bson:"_id"`
	YogaName      string             `json:"yoga_name"`
	ImageUrl      string             `json:"image_url"`
	StepsList     []string           `json:"steps_list"`
	StepDuration  []int              `json:"step_duration"`
	HealthTag     string             `json:"health_tag"`
	TotalDuration int                `json:"total_duration"`
}
