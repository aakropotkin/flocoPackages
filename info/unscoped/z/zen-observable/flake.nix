{

  inputs.packument.url   = "https://registry.npmjs.org/zen-observable?rev=48-4e4841cf5d6b68c9d529a8f189a8e2c4";
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
    ident = "zen-observable";
    ldir  = "info/unscoped/z/zen-observable";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
