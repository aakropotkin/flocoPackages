{

  inputs.packument.url   = "https://registry.npmjs.org/is-nan?rev=24-59c303b0d707bfc61aea11dc3e2a37c4";
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
    ident = "is-nan";
    ldir  = "info/unscoped/i/is-nan";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
