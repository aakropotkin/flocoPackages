{

  inputs.packument.url   = "https://registry.npmjs.org/d3-zoom?rev=40-109d4f9efe6eef28cb9c7d35f2312e46";
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
    ident = "d3-zoom";
    ldir  = "info/unscoped/d/d3-zoom";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
