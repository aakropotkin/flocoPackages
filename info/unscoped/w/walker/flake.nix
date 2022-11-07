{

  inputs.packument.url   = "https://registry.npmjs.org/walker?rev=38-e8cd8ff3ddc7bf95594c81e81edcbdba";
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
    ident = "walker";
    ldir  = "info/unscoped/w/walker";
    inherit packument fetchInfo;
  } // latest';

}
