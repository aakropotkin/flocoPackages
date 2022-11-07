{

  inputs.packument.url   = "https://registry.npmjs.org/is-weakmap?rev=11-ad76b568821bddeb6d3cc63b1f65d608";
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
    ident = "is-weakmap";
    ldir  = "info/unscoped/i/is-weakmap";
    inherit packument fetchInfo;
  } // latest';

}
