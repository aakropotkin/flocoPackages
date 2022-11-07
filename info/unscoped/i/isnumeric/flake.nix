{

  inputs.packument.url   = "https://registry.npmjs.org/isnumeric?rev=39-78678c521c09f5cee258069cc711d7ad";
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
    ident = "isnumeric";
    ldir  = "info/unscoped/i/isnumeric";
    inherit packument fetchInfo;
  } // latest';

}
