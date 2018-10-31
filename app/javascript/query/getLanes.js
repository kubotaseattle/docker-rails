import gql from 'graphql-tag';

export const getLanes = gql `
{
  lanes{
    id
    name
  }
}
`;
