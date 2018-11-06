import gql from 'graphql-tag';

export const createLane = gql`
	mutation createLane($lane: LaneInputType!) {
		createLane(lane: $lane) {
				id
				name
		}
	}
`;
