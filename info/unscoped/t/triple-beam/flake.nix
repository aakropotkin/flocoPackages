{

  inputs.packument.url   = "https://registry.npmjs.org/triple-beam?rev=10-78467645dc86de8f675a19756f7302c9";
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
    ident = "triple-beam";
    ldir  = "info/unscoped/t/triple-beam";
    inherit packument fetchInfo;
  } // latest';

}
