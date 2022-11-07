{

  inputs.packument.url   = "https://registry.npmjs.org/web-streams-polyfill?rev=41-954386219da3550caf77ae34e607811b";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "web-streams-polyfill";
    ldir  = "info/unscoped/w/web-streams-polyfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
