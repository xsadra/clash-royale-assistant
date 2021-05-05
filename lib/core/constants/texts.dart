const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHE_FAILURE_MESSAGE = 'Cache Failure';
const UNEXPECTED_ERROR = 'Unexpected error';

const API_TOKEN =
    String.fromEnvironment('UPCOMING_CHESTS_API_TOKEN', defaultValue: '');
const API_TOKEN_PROXY =
    String.fromEnvironment('UPCOMING_CHESTS_API_TOKEN_PROXY', defaultValue: '');

const API_BASE_URL = 'https://api.clashroyale.com/';
const API_BASE_URL_PROXY = 'https://proxy.royaleapi.dev/';
const API_PLAYER_URL = 'v1/players/';
const API_BASE_PLAYER_URL = API_BASE_URL + API_PLAYER_URL;
const UPCOMING_CHESTS = '/upcomingchests';

const CACHED_UPCOMING_CHESTS = 'CACHED_UPCOMING_CHESTS';
