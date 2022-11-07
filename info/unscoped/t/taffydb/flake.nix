{

  inputs.packument.url   = "https://registry.npmjs.org/taffydb?rev=20-98bf95965877e653f87622e2241d6844";
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
    ident = "taffydb";
    ldir  = "info/unscoped/t/taffydb";
    inherit packument fetchInfo;
  } // latest';

}
