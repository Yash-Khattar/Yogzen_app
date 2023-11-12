package model

import "go.mongodb.org/mongo-driver/bson/primitive"

type UserModel struct {
	ID          primitive.ObjectID `json:"_id,omitempty" bson:"_id,omitempty"`
	Name        string             `json:"name,omitempty"`
	Email       string             `json:"email,omitempty"`
	Password    string             `json:"password,omitempty"`
	AvatarImage string             `json:"avatarimage,omitempty"`
}
