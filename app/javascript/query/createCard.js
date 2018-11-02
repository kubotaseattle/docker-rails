import gql from 'graphql-tag';

export const createCard = gql`
	mutation createCard($task: TaskInputType!) {
		createCard(task: $task) {
				id
				name
				laneId
		}
	}
`;
