{

  inputs.packument.url   = "https://registry.npmjs.org/normalize-range?rev=7-26ec3d33e2aefab85442fcb7aea78a5c";
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
    ident = "normalize-range";
    ldir  = "info/unscoped/n/normalize-range";
    inherit packument fetchInfo;
  } // latest';

}
