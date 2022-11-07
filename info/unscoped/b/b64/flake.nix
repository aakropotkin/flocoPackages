{

  inputs.packument.url   = "https://registry.npmjs.org/b64?rev=36-c1db6fe1866f54cf9a8d77ec528689c4";
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
    ident = "b64";
    ldir  = "info/unscoped/b/b64";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
