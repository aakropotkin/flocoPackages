{

  inputs.packument.url   = "https://registry.npmjs.org/web3-core-promievent?rev=124-1ac7e66f2fabaaf3a944bf4fa420a95b";
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
    ident = "web3-core-promievent";
    ldir  = "info/unscoped/w/web3-core-promievent";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
