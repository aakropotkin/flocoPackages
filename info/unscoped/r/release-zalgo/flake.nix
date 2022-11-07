{

  inputs.packument.url   = "https://registry.npmjs.org/release-zalgo?rev=3-c0fb037cff816facfd0d909f0cf969d7";
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
    ident = "release-zalgo";
    ldir  = "info/unscoped/r/release-zalgo";
    inherit packument fetchInfo;
  } // latest';

}
