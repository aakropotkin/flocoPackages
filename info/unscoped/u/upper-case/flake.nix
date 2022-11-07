{

  inputs.packument.url   = "https://registry.npmjs.org/upper-case?rev=24-29567f4ced1caa925bd7ce2de81a1b32";
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
    ident = "upper-case";
    ldir  = "info/unscoped/u/upper-case";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
