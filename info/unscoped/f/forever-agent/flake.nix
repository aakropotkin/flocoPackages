{

  inputs.packument.url   = "https://registry.npmjs.org/forever-agent?rev=21-28fb5655544ddea141f524c88490c290";
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
    ident = "forever-agent";
    ldir  = "info/unscoped/f/forever-agent";
    inherit packument fetchInfo;
  } // latest';

}
