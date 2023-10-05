import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'changeMessage' : ActorMethod<[string], undefined>,
  'seeMessage' : ActorMethod<[], string>,
}
