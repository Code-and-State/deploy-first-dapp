export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'changeMessage' : IDL.Func([IDL.Text], [], []),
    'seeMessage' : IDL.Func([], [IDL.Text], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
