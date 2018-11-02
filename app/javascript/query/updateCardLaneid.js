import gql from 'graphql-tag';

export const updateCardLaneid = gql`
	mutation updateCardLaneid($task: TaskInputType!) {
		updateCardLaneid(task: $task) {
				laneId
		}
	}
`;
