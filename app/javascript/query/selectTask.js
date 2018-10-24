import gql from 'graphql-tag';

// selectのクエリ
export const SELECT_TASK = gql`
  {
    tasks {
      id
      name
    }
  }
`;
