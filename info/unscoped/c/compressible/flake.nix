{

  inputs.packument.url   = "https://registry.npmjs.org/compressible?rev=58-73ea2ae03785aae25ca02eddc7a696f1";
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
    ident = "compressible";
    ldir  = "info/unscoped/c/compressible";
    inherit packument fetchInfo;
  } // latest';

}
